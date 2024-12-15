#Maintainer: Popolon <popolon aL popolon.org>
#Made with pip2pkgbuild --pep517 and tuned

pkgname='python-rtmidi2'
_module='rtmidi2'
_src_folder='rtmidi2-1.4.0'
pkgver='1.4.0'
pkgrel=3
pkgdesc="Python wrapper for RtMidi written in Cython. Allows sending raw messages, multi-port input and sending multiple messages in one call."
url="https://github.com/gesellkammer/rtmidi2"
depends=('python' 'cython' 'rtmidi')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('custom:MIT License')
arch=('x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64' 'powerpc' 'powerpc64le' 'powerpc64')
source=("https://files.pythonhosted.org/packages/c3/16/5b42db7509a3b6d300f34aef5988ed39b9e50b164a49c9d0d2f9e7e7303f/rtmidi2-1.4.0.tar.gz")
sha256sums=('eec5185beed7aa006bb7bcc058c58e10f245362e0db1636ae621917dc3d52ead')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
