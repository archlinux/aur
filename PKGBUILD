# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Berhard Landauer <oberon@manjaro.org>

pkgname=samsung-ssd-dc-toolkit
pkgver=2.1
pkgrel=2
pkgdesc="CLI tool for management and diagnosgtics of SSD's primarily targeted for servers and data centers"
url='https://semiconductor.samsung.com/consumer-storage/support/tools/'
arch=('x86_64')
license=('custom')
depends=(
        'gcc-libs'
        'glibc'
        'hdparm'
        'jsoncpp'
)
conflicts=('samsung_magician-consumer-ssd')
source=("https://www.samsung.com/semiconductor/global.semi.static/Samsung_SSD_DC_Toolkit_for_Linux_V$pkgver"
        'LICENSE')
b2sums=('b5c2b26099449cf2e259b798e6ab2e978c5806753ae4d2c352db2cb74e540c02f6ae4b18de6d159531292a5f22afa8d05cef2a36b17b2786401bc072fb8e8255'
        '8e12c9640eadde76cb508dfde2059d5c1fdd55192bbda15ba7026d068644aa3e302770a018ce8704a146d65f84338c14756522430cbb21070ea767978c80bd38')
options=('!strip')

package() {
  install -Dm755 "Samsung_SSD_DC_Toolkit_for_Linux_V$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cd "$pkgdir/usr/bin"
  ln -s "$pkgname" magician
}
