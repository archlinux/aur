# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-bin
pkgver=0.5.0
_projectver=0.4.0
pkgrel=2
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
depends=('webkit2gtk' 'openssl-1.1')
provides=('modrinth-app')
conflicts=('modrinth-app' 'modrinth-app-git')
source=("https://launcher-files.modrinth.com/versions/$_projectver/linux/modrinth-app_${pkgver}_amd64.deb")
sha256sums=('d68a74e432cda2bf8a0d094bcd6641f8196e9d8de056d3bbfc45cc86c66311d6')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
