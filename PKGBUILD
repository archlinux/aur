# Maintainer: Jeremiah Ticket <seashellpromises@gmail.com>

pkgname=nvda2speechd-bin
pkgver=0.1
pkgrel=1
pkgdesc="A bridge between Windows applications that speak through NVDA and Speech dispatcher"
arch=('x86_64')
license=('LGPL')
url="https://github.com/RastislavKish/nvda2speechd"
depends=('speech-dispatcher')
provides=('nvda2speechd')
source=("https://github.com/RastislavKish/nvda2speechd/releases/download/v${pkgver}/nvda2speechd"
"https://github.com/RastislavKish/nvda2speechd/releases/download/v${pkgver}/nvda2speechd32.dll"
"https://github.com/RastislavKish/nvda2speechd/releases/download/v${pkgver}/nvda2speechd64.dll"
"nvda2speechd.service"
)
sha256sums=('5dc10cd8d129bda8be100d8021818e623acd4b504ad3b98eff0e8a77db9d1fa0'
            '916eb83c7aacb5c577af1a0eaad61eb2dfc7b9ead5d1d4ae898a5b4c7daeb517'
            '96b79102ec727a39a6e862c00bde188d640456679344c83eb88afc459fc4a434'
            '436360d3e3bae26c3dbb5298d74f6d877c61231f8aa912dfa5f40d51f3f2cd68')
install=nvda2speechd.install

package() {
install -Dm755 $srcdir/nvda2speechd $pkgdir/usr/bin/nvda2speechd
install -Dm655 $srcdir/nvda2speechd32.dll $pkgdir/usr/share/nvda2speechd/nvda2speechd32.dll
install -Dm655 $srcdir/nvda2speechd64.dll $pkgdir/usr/share/nvda2speechd/nvda2speechd64.dll
install -Dm655 nvda2speechd.service $pkgdir/usr/lib/systemd/user/nvda2speechd.service
}
