# Maintainer: P4ndaShi <p4ndab3y@proton.me>
pkgname=anizium-desktop-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Anizium için modern, sade ve Discord destekli Linux masaüstü uygulaması"
arch=('x86_64')
url="https://github.com/P4ndaShi/Anizium-Desktop-Linux"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'alsa-lib' 'libxss' 'libxtst')
provides=('anizium-desktop')
conflicts=('anizium-desktop')
options=('!strip' '!debug')
# GitHub'daki indirilebilir .pacman dosyanı kaynak gösteriyoruz
source=("${pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/anizium-desktop-${pkgver}.pacman")
# Senin için hesapladığım SHA256 güvenlik kodu
sha256sums=('150eb2a3c0eb6686d4b4ce08f085c50fc922617286a8db45e9c671702ccc0abd')
package() {
    # .pacman dosyası aslında bir tır (tar.zst) paketidir, içine çıkartalım
    tar -xf "${srcdir}/${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"
}