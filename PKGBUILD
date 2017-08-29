# Maintainer: Michael Mitchell <mmitc@protonmail.com>
pkgname=wild-chat
pkgver=v1.1.34
pkgrel=4
pkgdesc="A Customizable Twitch Chat Client"
arch=('any')
url="https://github.com/AWildBeard/WildChat"
license=('Apache License 2.0')
depends=('jre8-openjdk' 'java-openjfx')

source=("https://github.com/AWildBeard/WildChat/releases/download/v1.1.34-4/wild-chat.tar")

md5sums=('6d5fde592af73ac7d1ac1ec23ce83faf')

package() {
		mkdir -p "${pkgdir}/usr/share/wildchat"
		install -Dm644 "${srcdir}/WildChat.jar" "${pkgdir}/usr/share/wildchat/WildChat.jar"
		mkdir -p "${pkgdir}/usr/share/applications/"
		install -Dm644 "${srcdir}/com.github.awildbeard.wildchat.desktop" "${pkgdir}/usr/share/applications/"
		mkdir -p "${pkgdir}/usr/share/appdata"
		install -Dm644 "${srcdir}/com.github.awildbeard.wildchat.appdata.xml" "${pkgdir}/usr/share/appdata"
		mkdir -p "${pkgdir}/usr/bin"
		install -Dm755 "${srcdir}/wild-chat.sh" "${pkgdir}/usr/bin/wild-chat.sh"
}
