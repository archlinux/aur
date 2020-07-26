# Maintainer: yjun <jerrysteve1101@gmail.com>
# Contributor: lazant <a.l.i.c.e at outlook.com>

pkgname=google-play-music-desktop-player-bin
_pkgname=${pkgname%-bin}
pkgver=4.7.1
pkgrel=1
pkgdesc="A beautiful cross platform Desktop Player for Google Play Music"
arch=('x86_64')
url="https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-"
license=('MIT')
depends=('avahi' 'libappindicator-gtk3')
provides=('google-play-music-desktop-player-git' 'google-play-music-desktop-player')
conflicts=('google-play-music-desktop-player-git' 'google-play-music-desktop-player')
source=("https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/v${pkgver}/LICENSE")
sha256sums=('b9d4f7fd01e4d7286af9c30c049b0c30c884f900d80f44d43d8a9bad0b4b55d2'
            '7253553744e72ab40fff010dc268cbdf01c4d95f313550aaf2c9b65c1cfb7ae7')

package() {
  tar -xf data.tar.xz -C ${pkgdir}

  rm -rf ${pkgdir}/usr/share/lintian
  rm -rf ${pkgdir}/usr/share/doc

  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim: set sw=2 ts=2 et:
