# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=asem51
pkgver=1.3
pkgrel=1
pkgdesc="ASEM-51 is a two-pass macro assembler for the Intel MCS-51 family of
microcontrollers."
arch=('i686' 'x86_64')
license=('Custom')
url="http://plit.de/asem-51/home.htm"
md5sums=('895fd5e6617f8b21b9f56484f9258c94')
source=("http://plit.de/asem-51/$pkgname-$pkgver-ELF.tar.gz")

package() {
  cd ${srcdir}/${pkgname}

  install -d "${pkgdir}"/usr/local/bin
  for i in $(find -executable -type f ! -path "*.sh"); do
    install -m755 "${i}" "${pkgdir}"/usr/local/bin/
  done

  install -d "${pkgdir}"/usr/local/man/man1
  for i in *.1; do
    install -m644 "${i}" "${pkgdir}"/usr/local/man/man1/
  done

  install -d "${pkgdir}"/usr/local/share/"${pkgname}"
  install -m644 asem_51.doc "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m644 blink.a51 "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m644 boot51.a51 "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m644 boot51.doc "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m644 demo.a51 "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m644 license.doc "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m644 README.1ST "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m644 release.130 "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m644 support.doc "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m755 install.sh "${pkgdir}"/usr/local/share/"${pkgname}"/
  install -m755 uninst51.sh "${pkgdir}"/usr/local/share/"${pkgname}"/

  install -d "${pkgdir}"/usr/local/share/"${pkgname}"/html
  for i in html/*; do
    install -m644 ${i} "${pkgdir}"/usr/local/share/"${pkgname}"/html/
  done

  install -d "${pkgdir}"/usr/local/share/"${pkgname}"/mcu
  for i in mcu/*; do
    install -m644 ${i} "${pkgdir}"/usr/local/share/"${pkgname}"/mcu/
  done
}
