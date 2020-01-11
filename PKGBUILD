# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=platformflashtoollite
pkgver=5.8.4.0
pkgrel=1
pkgdesc='Flashes firmware and OS images onto Intel-based devices'
arch=('x86_64')
url='https://01.org/android-ia/downloads/intel-platform-flash-tool-lite'
license=('custom')
source=("https://download.01.org/android-ia/tools/platformflashtool-lite/${pkgver}/${pkgname}_${pkgver}_linux_x86_64.deb")
sha256sums=('715a0e817fcaa97b41b3e58d1a1dc3d26bf7c871ce46b1b6e9ebf4d2f4d2842a')


prepare() {
  tar xvf data.tar.gz
}

package() {
  for i in {etc,opt,usr}
  do
    cp -dpr --no-preserve=ownership $i "${pkgdir}"
  done

  install -Dm644 "${srcdir}/opt/intel/${pkgname}/Licenses/Intel_Development_Tools_Limited_License_Agreement.txt" \
        "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
