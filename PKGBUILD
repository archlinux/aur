pkgname='python-eng-to-ipa'
_module='eng-to-ipa'
_src_folder='eng_to_ipa-0.0.2'
pkgver='0.0.2'
pkgrel=1
pkgdesc="take English text and convert it to IPA"
url="https://pypi.org/project/eng-to-ipa/"
depends=('python' 'python-setuptools>=44.1.0')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/62/3d/8656290e2d537ef66e984a04e903d1a0028ea01524e9dd89e45bb165bc7b/eng_to_ipa-0.0.2.tar.gz")
sha256sums=('0e4fac8370b0ffeaf696193e971b3ff9bd3762e4d153c6d0d280147887e008b1')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
