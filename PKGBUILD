# Maintainer: Albert Fazlyev <albert.fz@yandex.ru>
pkgname=yandex-messenger
pkgver=2.155.0
pkgrel=2
pkgdesc="Yandex Messenger is designed for communication: send text messages, make audio and video calls in private and group chats, subscribe to and create channels. Communicate with colleagues in a private space."
arch=('x86_64')
url="https://yandex.ru/support/messenger/install.html"
license=('custom')

source=("${pkgname}_${pkgver}::null")
noextract=("${pkgname}_${pkgver}_amd64.deb")

depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
b2sums=('b22f77140bf2ee7e7c70a6ab9e96d45a3b8f568386ddcadb7e57c4e5bd6f57e9cf77276cf737b016aade1148e60af51aaad4ebf153551f725242caa0713528c1')


package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/Yandex Messenger/chats' "${pkgdir}/usr/bin/yandex-messenger"
}

