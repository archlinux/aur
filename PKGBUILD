#Maintainer: naruto522ru <itachi522ru@gmail.com>
pkgname=rto-proxy-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='RuTracker proxy app based at electron + angularjs'
arch=('x86_64' 'i686')
url='https://rutracker.cr/forum/viewtopic.php?t=5403116'
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'libxss' 'nss')
options=(!strip)
install=rto-proxy-bin.install

source_x86_64=("https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.2.3/rto-proxy_0.2.3_amd64.deb" "https://www.dropbox.com/s/ghpvkkifaw6qrh8/app.asar")
source_i686=("https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.2.3/rto-proxy_0.2.3_i386.deb" "https://www.dropbox.com/s/ghpvkkifaw6qrh8/app.asar")
md5sums_x86_64=('ba8229621770652696b07152d15d703b'
                '97dcbd2db3810aa62b02f24a6fa06b92')
md5sums_i686=('4d7ccd828131840f15b382ce5d08ff3b'
              '97dcbd2db3810aa62b02f24a6fa06b92')



package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm 755 "$srcdir/app.asar" "$pkgdir/opt/rto-proxy/resources/"
}
 msg2 "Moving stuff in place..."
