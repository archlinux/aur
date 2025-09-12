# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=25.8.0.490
pkgrel=0

pkgdesc="MAX is a multifunctional digital platform with a fully integrated messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")

depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libsecret")
makedepends=("tar" "binutils")
optdepends=(
    'libappindicator-gtk3: tray icon'
    'libayatana-appindicator: tray icon'
)

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("https://download.max.ru/electron/MAX.deb")
sha256sums=('133d3e4c2194cf6f2adc0e4c3ba0fccc367928a5c6cb6e644ff0947967c612a3')

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -r "${srcdir}/usr" "${pkgdir}/"
    cp -r "${srcdir}/opt" "${pkgdir}/"

    install -d "$pkgdir/usr/bin"
    #ln -s "/opt/MAX/MAX" "${pkgdir}/usr/bin/MAX"
}
