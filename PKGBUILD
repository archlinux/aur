# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su <contact@dannysu.com>

pkgname=duplicati-latest
pkgver=2.0.1.32
pkgrel=1
pkgdesc='A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers'
url='http://duplicati.com'
license=('LGPL')
install='duplicati.install'
source=("https://github.com/duplicati/duplicati/releases/download/v2.0.1.32-2.0.1.32_canary_2016-11-12/duplicati-2.0.1.32_canary_2016-11-12.zip" 'duplicati.service')
sha1sums=('6ba8ef82b8c91f3a73be4de74f59cce1ca9c194c'
          '8298fe7fbe3ba71a9773220ab236eb6350e89f87')
sha256sums=('73cd8ab89e815660782403943aa7a54001a65e530af6dcbe28634900c8cae23e'
            '3237249cb9de137c3284a5cd92a451f3a49ec2183c6254be4b5ef7969e04e4a1')
arch=('i686' 'x86_64')
depends=('gtk-sharp-2' 'mono')


package() {
  # Install the service.
  install -Dm644 duplicati.service  "${pkgdir}/usr/lib/systemd/system/duplicati.service"
  rm duplicati.service
  # Install the program.
  rm *.zip
  mkdir -p "${pkgdir}/opt/duplicati-latest"
  cp -r . "${pkgdir}/opt/duplicati-latest"
}
