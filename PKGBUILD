# Maintainer: Kevin McNamara (github.com/kjmcnamara1)
pkgname=cecilia-bin
_name=cecilia
pkgver=0.49.0
pkgrel=1
pkgdesc='Keyboard-first editor and player for guitar tab, standard notation and Gregorian chant (prebuilt binary)'
arch=('x86_64')
url='https://github.com/kjmcnamara1/cecilia'
license=('MIT' 'Apache-2.0')
depends=('alsa-lib' 'gcc-libs' 'glibc')
optdepends=('vulkan-icd-loader: GPU drawing in the window'
            'libxkbcommon: keyboard input in the window'
            'wayland: Wayland window'
            'libx11: X11 window'
            'libxcursor: X11 mouse cursors')
provides=("$_name=$pkgver")
conflicts=("$_name")
options=('!debug')
source=("$url/releases/download/v$pkgver/$_name-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('2b5c034a73fdd346a24f6f96a93ed2486444f4ccc71948c008cad2b90ef5583e')

package() {
  cd "$_name-v$pkgver-x86_64-unknown-linux-gnu"
  linux/stage.sh "$pkgdir" /usr ./cecilia
}
