pkgbase=python-aws-okta-keyman
pkgname=python-aws-okta-keyman
_project_name='aws-okta-keyman'
_module='aws_okta_keyman'
pkgver=0.8.5
pkgrel=1
pkgdesc="AWS Okta Keyman"
url="https://github.com/nathan-v/aws_okta_keyman"
depends=(
    'python-colorlog'
    'python-beautifulsoup4'
    'python-requests'
    'python-boto3'
    'python-future'
    'python-pyaml'
    'python-keyring'
)
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_project_name::1}/$_project_name/$_module-$pkgver.tar.gz")
sha256sums=('7dc9457011242b1d47af066d3b6acc1553ca655d9147f9b0c1212ceff97b2acc')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
