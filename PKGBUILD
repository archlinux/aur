# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su <contact@dannysu.com>

pkgname=duplicati-latest
pkgver=2.0.1.52
pkgrel=1
pkgdesc='A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers'
url='http://duplicati.com'
license=('LGPL')
install='duplicati.install'
source=("https://github.com/duplicati/duplicati/releases/download/v2.0.1.52-2.0.1.52_canary_2017-03-13/duplicati-2.0.1.52_canary_2017-03-13.zip"
        'duplicati.service' 'duplicati-user.service')
sha1sums=('35b8ae50d0c8f04145bf9b8b251c6c0249033ad7'
          '8298fe7fbe3ba71a9773220ab236eb6350e89f87'
          '87efc36e4eb6d6388b532d5ee66e705f4d7ae96f')
sha256sums=('1d7fbdb6a6ddda15f69914f7afc1eba14a79601907ee34dc36e2527a42a8c387'
            '3237249cb9de137c3284a5cd92a451f3a49ec2183c6254be4b5ef7969e04e4a1'
            '1a29b9d83f70cb98927bdc0116d1d9f160d2d9ab1de63ce29bd99c3a3842a54b')
arch=('i686' 'x86_64')
depends=('gtk-sharp-2' 'mono')


package() {
  # Install the service.
  install -Dm644 duplicati.service  "${pkgdir}/usr/lib/systemd/system/duplicati.service"
  install -Dm644 duplicati-user.service  "${pkgdir}/usr/lib/systemd/user/duplicati.service"
  rm duplicati.service duplicati-user.service

  # Install the program.
  rm *.zip
  mkdir -p "${pkgdir}/opt/duplicati-latest"
  cp -r . "${pkgdir}/opt/duplicati-latest"
}
