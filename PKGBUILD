# Maintainer: Christian Kohlstedde <christian@kohlsted.de>

_name=OpenOB
pkgname=openob
pkgver=4.0.2
pkgrel=1
pkgdesc="A GStreamer based app a configurable RTP audio link system"
arch=('x86_64')
url="https://github.com/JamesHarrison/openob"
license=('BSD')
depends=(
  'python'
  'python-redis'
  'python-gobject'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-python'
  'gobject-introspection'
)
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "LICENSE")
noextract=()
sha256sums=('650609cfd87e54371f5141b5aa6dc4079cbd9386c22de420488509325841bb37'
            '36cf4ab7947bb6c146c13457bfda770a5ea208d176c3dd3c7820857c559cd523')

build() {
	cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
