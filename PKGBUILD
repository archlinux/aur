# Maintainer: Albert Fazlyev <albert.fz@yandex.ru>
pkgname=yandex-messenger
pkgver=2.155.0
pkgrel=3
pkgdesc="Yandex Messenger is designed for communication: send text messages, make audio and video calls in private and group chats, subscribe to and create channels. Communicate with colleagues in a private space."
arch=('x86_64')
url="https://yandex.ru/support/messenger/install.html"
license=('custom')

source=("${pkgname}_${pkgver}_amd64.deb::https://downloader.disk.yandex.ru/disk/f6a0eadb9c9d5faf52f085b26086581105c1d735cbf4341cf1c370935745df7d/656a4951/fKqInKw3d7bLFOeFnMGnhNWxCpe349obSYmly8cW7zZJ_fniSbaCrlwjQTbvB92IUPUnXitKQ2ltyzIVVtHF0RfdGUpZH039231ae3iQvySr8npumZHI4midPdWhecNq?uid=0&filename=Yandex_Messenger_2.155.0_amd64.deb&disposition=attachment&hash=7bGpeID6q904ZsjE4/ehCmxnCtN1OkUIf5Iszu%2B0hU8Gu1h8chTxFpPyI2je%2BlPrlsg4VIaLrfRKbQetv4dueQ%3D%3D%3A&limit=0&content_type=application%2Fvnd.debian.binary-package&owner_uid=1130000063429726&fsize=73548980&hid=d833151ad80ffb273b072a7a34c673d9&media_type=compressed&tknv=v2")
noextract=("${pkgname}_${pkgver}_amd64.deb")

depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
b2sums=('b22f77140bf2ee7e7c70a6ab9e96d45a3b8f568386ddcadb7e57c4e5bd6f57e9cf77276cf737b016aade1148e60af51aaad4ebf153551f725242caa0713528c1')


package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/Yandex Messenger/chats' "${pkgdir}/usr/bin/yandex-messenger"
}

