# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=hash-checker
pkgver=2.1
pkgrel=1
pkgdesc="A Free tool for checking any file's MD5, SHA256 & SHA512 hash easily"
arch=('x86_64')
url="https://github.com/Rizwan-Hasan/Hash-Checker/"
license=('MIT')
depends=('python>=3.6.6' 'python-pyqt5>=5.11.2' 'python-sip-pyqt5>=4.19.12' 'pyqt5-common>=5.11.2' 'python-pyperclip>=1.6.2' 'python-packaging>=17.1')
makedepends=('cython>=0.28.4')
source=(Hash-Checker.tar.gz::"https://github.com/Rizwan-Hasan/Hash-Checker/archive/v${pkgver}.tar.gz"
                             "Hash Checker.desktop")
md5sums=('66f6ea663a0206e980bfc96cd8c83685' 
		 'b2cedfbfe84c6e8688a018545414dc8e')

package() {
  cd ${srcdir}/Hash-Checker-${pkgver}
  install -d ${pkgdir}/opt/Hash-Checker
  install -d ${pkgdir}/usr/share/applications
  cp -avr * ${pkgdir}/opt/Hash-Checker/
  cp -avr "../Hash Checker.desktop" ${pkgdir}/usr/share/applications/
  chmod 777 "${pkgdir}/usr/share/applications/Hash Checker.desktop"
  chmod +x "${pkgdir}/usr/share/applications/Hash Checker.desktop"
  cp -v ${pkgdir}/opt/Hash-Checker/icons/icon.png ${pkgdir}/opt/Hash-Checker/
  rm -v ${pkgdir}/opt/Hash-Checker/README.md
  rm -drv ${pkgdir}/opt/Hash-Checker/docs
  rm -drv ${pkgdir}/opt/Hash-Checker/icons
  rm -drv ${pkgdir}/opt/Hash-Checker/extra_icons
  rm -drv ${pkgdir}/opt/Hash-Checker/requirements.txt
  mv -vf ${pkgdir}/opt/Hash-Checker/LICENSE ${pkgdir}/opt/Hash-Checker/LICENSE.txt
  chmod 755 ${pkgdir}/opt/Hash-Checker
}
