pkgbase=python-aws-okta-keyman
pkgname=python-aws-okta-keyman
_project_name='aws-okta-keyman'
_module='aws_okta_keyman'
pkgver=0.9.0
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
sha256sums=('58ba9cb40402ab8bcae2fd8bbcf9966cf9416436cfc84636cadca0e27d5f90a1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
