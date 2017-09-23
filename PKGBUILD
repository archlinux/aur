# Maintainer: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=go-luks-suspend
pkgver=1.4.2
pkgrel=1
pkgdesc='Encrypt LUKS volumes on system suspend'
arch=('x86_64')
url='https://github.com/guns/go-luks-suspend'
license=('GPL3')
depends=('systemd' 'cryptsetup' 'mkinitcpio')
makedepends=('go')
install=install
conflicts=('arch-luks-suspend' 'arch-luks-suspend-git')
source=("https://github.com/guns/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('b6c2341cc966af2c3c89a5f85599e5f29a3d0b7c')
sha256sums=('4627e81eecf7675d79823369a75c02cab629035ebfcc4b341f3c31c02314c41d')
sha512sums=('bcc466806e1eda7fb67c47ddde7ade1deec1b6d4073ca9f612e1073443c3ddd5fa3bc9b2fb8f5cf195edf53fc5b8e20ab984abfaa7b2cc81c75a95b4f0284a5d')

build() {
  cd "$pkgname-$pkgver"

  make clean all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
