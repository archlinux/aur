# Maintainer: YOUR NAME <your-email@example.com>
pkgname=tigervnc-runit
pkgver=1.0.0
pkgrel=1
pkgdesc='runit service to supervise independent TigerVNC X11 sessions on Artix'
arch=('any')
url='https://tigervnc.org/'
license=('0BSD')
depends=('tigervnc' 'runit')
optdepends=(
  'dwm: for the bundled dwm-vnc session example'
  'openssh: for encrypted SSH tunnelling to the VNC server'
)
backup=('etc/conf.d/tigervnc-runit')
source=(
  'tigervnc.run'
  'tigervnc.log.run'
  'tigervnc-runit.conf'
  'dwm-vnc.desktop'
  'README.md'
  'LICENSE'
)
sha256sums=(
  'e2b046ce7888229c138248bc6d29508250767d9aec557a0a60fa08b506984808'
  'aad9bca13cfe0e63bc84ec79b9caca28ec6a4b629c98bba0e20c7d31a5e9e5a3'
  '5417186636781471e3c8d035180b97db324695a4502a94cd6ddf96f95169eabb'
  '88b908c474d4fcbe2364fa62669ff1ed77357e5727ef4e3f2585a08693a1f1e1'
  '7f8f32c5156b4612495200e65daa382830ba5aca1cb93375a419cec5f6a3c153'
  'a40568aafe45739ab5987f31fddcfc98a1980ab7bc96b919c6440eac4d88187c'
)

package() {
  install -Dm755 "$srcdir/tigervnc.run" \
    "$pkgdir/etc/runit/sv/tigervnc/run"
  install -Dm755 "$srcdir/tigervnc.log.run" \
    "$pkgdir/etc/runit/sv/tigervnc/log/run"
  install -Dm644 "$srcdir/tigervnc-runit.conf" \
    "$pkgdir/etc/conf.d/tigervnc-runit"
  install -Dm644 "$srcdir/dwm-vnc.desktop" \
    "$pkgdir/usr/share/doc/$pkgname/dwm-vnc.desktop"
  install -Dm644 "$srcdir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
