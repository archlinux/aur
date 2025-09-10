pkgname='python-ed25519-blake2b'
_module='ed25519-blake2b'
_src_folder='ed25519-blake2b-1.4.1'
pkgver='1.4.1'
pkgrel=1
pkgdesc="Ed25519 public-key signatures (BLAKE2b fork)"
url="https://github.com/Matoking/python-ed25519-blake2b"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('any')
source=("https://files.pythonhosted.org/packages/79/e5/03cc85b437e96c21ea705c0215b89e88a0802e72b4b07d452b5858b7a1d1/ed25519-blake2b-1.4.1.tar.gz")
sha256sums=('731e9f93cd1ac1a64649575f3519a99ffe0bb1e4cf7bf5f5f0be513a39df7363')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
