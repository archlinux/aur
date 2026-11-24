# Maintainer: YOUR NAME <your-email@example.com>
pkgname=tigervnc-runit
pkgver=1.1.0
pkgrel=2
pkgdesc='runit services for virtual and existing-X11 TigerVNC sessions on Artix'
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
  'tigervnc-share.run'
  'tigervnc.log.run'
  'tigervnc-share.log.run'
  'tigervnc-runit.conf'
  'dwm-vnc.desktop'
  'README.md'
  'LICENSE'
)
sha256sums=(
  '4127a84aee6e183ee2ef9c79941928a719bde76870a1110a6b0466b79874bca6'
  '8eabe5d5e34fd0fe02bf6e4c75bf984b7b2fcaf9ab54f5ce89c880d9a78fd73c'
  'a505763ebf27ca0e93da832c833b9c6d33433b08c6812e028e20954a128e70b8'
  'd30ce4675226ef1640f8c7733e27f15255f8b3e82436405f4dbdf2a33ca3f390'
  '9f0c817c7f3c33d5edca7023e88feca588d1f3b221b52267949e2b05d7cffcd5'
  'a7bb286dbb6d741b413c7048476ad9bce6cc861a38e84455878f6cde76effc31'
  'ce699b5cbf4ef47cc4b4035d0d98591d7da1c507a9a0ab71333c82f2444a6da3'
  'a40568aafe45739ab5987f31fddcfc98a1980ab7bc96b919c6440eac4d88187c'
)

package() {
  install -Dm755 "$srcdir/tigervnc.run" \
    "$pkgdir/etc/runit/sv/tigervnc/run"
  install -Dm755 "$srcdir/tigervnc.log.run" \
    "$pkgdir/etc/runit/sv/tigervnc/log/run"
  install -Dm755 "$srcdir/tigervnc-share.run" \
    "$pkgdir/etc/runit/sv/tigervnc-share/run"
  install -Dm755 "$srcdir/tigervnc-share.log.run" \
    "$pkgdir/etc/runit/sv/tigervnc-share/log/run"
  install -Dm644 "$srcdir/tigervnc-runit.conf" \
    "$pkgdir/etc/conf.d/tigervnc-runit"
  install -Dm644 "$srcdir/dwm-vnc.desktop" \
    "$pkgdir/usr/share/doc/$pkgname/dwm-vnc.desktop"
  install -Dm644 "$srcdir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
