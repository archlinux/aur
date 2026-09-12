# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=locally-uncensored
pkgname=locally-uncensored-bin
pkgver=2.6.9
pkgrel=3
pkgdesc="Plug-and-play local AI studio — uncensored chat, image & video generation, and a coding agent"
arch=('x86_64')
url="https://github.com/PurpleDoubleD/locally-uncensored"
license=('AGPL-3.0-only')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator'
         'libgcc' 'libgomp' 'libstdc++' 'libsoup3' 'openssl' 'vulkan-icd-loader' 'wayland'
         'webkit2gtk-4.1')
optdepends=('python312: ComfyUI / speech-to-text backends (LU needs Python 3.10-3.12; run "python3.12 -m ensurepip --user" once to give it pip)')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source=("$pkgname-$pkgver.deb::https://github.com/PurpleDoubleD/$_pkgname/releases/download/v$pkgver/Locally.Uncensored_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/PurpleDoubleD/$_pkgname/v$pkgver/LICENSE")
sha256sums=('a81c8ff1df3d2a34d0454c5a370a099f8eb1997b964ef2ffdd9ad41d8136972e'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
  bsdtar -xzf "$srcdir/data.tar.gz" -C "$pkgdir"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
