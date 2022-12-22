# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=youtrack
pkgver=2022.3.65353
pkgrel=1
pkgdesc='Issue tracker designed for development teams'
arch=('i686' 'x86_64')
url='https://www.jetbrains.com/youtrack/'
license=('custom:jetbrains')
depends=('java-runtime-headless')
backup=('etc/youtrack/youtrack.conf')
options=('!strip')
source=("youtrack-${pkgver}.jar::https://download.jetbrains.com/charisma/${pkgname}-${pkgver}.jar"
        youtrack.conf
        youtrack.service
        youtrack.sysusers
        youtrack.tmpfiles
        LICENSE)
noextract=('youtrack.jar')
b2sums=('f03d9a636d7c51c7d05d0e1627c1634402a8afcea5a0685173b8f4a2d18215b7a8f241f8ddf01f40d024fb573764c7d54391e54df45216fa9d85456aaed9b2df'
        'bea90c36e6658a671ec99b99cf5c0ec6fa7abb5f744cc5738dd53833308f2b005353fb4621f9f8586384be54e42a7557fa94b6f10a3d8ab57fe81cd2e4006696'
        'a9267c85339b55dd68cdc110b8134495be9db3b99d38ac4b3e08d9862abb6817e58ced9071a04b5d65d72e7c6c5f9a92fe6d390eb647ae69ce265749b2a25ca6'
        '7f9ef6cd0e6feb97b2e700096e0bfad0b8d3abd4080bf9d5c8cf64a86e28ec4b8ff92787ebd8afa1dead5e56e771b1084e03f8cfd4045ed4d8ef4e5a2b8bbc5e'
        '3579f249e0b9a6d284f18308bb3d7fddda11cf4cbc10bb41420919133a44d81b5229382b777c4c52c94646ee73793fd910f1b33a981b84642aa02fd808a65930'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package() {
  install -dm700 "${pkgdir}"/var/lib/youtrack/
  install -Dm644 ${pkgname}.conf "${pkgdir}"/etc/youtrack/${pkgname}.conf
  install -Dm644 ${pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
  install -Dm644 ${pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm755 ${pkgname}-${pkgver}.jar "${pkgdir}"/usr/share/youtrack/${pkgname}.jar
}
