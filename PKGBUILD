# Maintainer: Vyacheslav Konovalov <echo dnlhY2hrb25vdmFsb3ZAZ21haWwuY29tCg== | base64 -d>

pkgname=robo3t-bin
_pkgver=1.3.1
pkgver=${_pkgver/-/_}
pkgrel=2
pkgdesc='Shell-centric MongoDB management tool'
arch=('x86_64')
url='https://robomongo.org/'
license=('GPLv3')
depends=('qt5-base' 'pcre' 'openssl-1.0')
replaces=('robomongo-bin')
conflicts=('robo3t' 'robomongo')
_tarfile="robo3t-${_pkgver}-linux-x86_64-7419c406"
source=("https://download-test.robomongo.org/linux/${_tarfile}.tar.gz"
        'https://raw.githubusercontent.com/Studio3T/robomongo/master/src/robomongo/gui/resources/icons/logo-256x256.png'
        'robo3t.desktop')
sha256sums=('11a664392a6472906d6ec01ea15ae13b9ef02844a9c7121f9f9834a8228ae5d6'
            'a63c4b244c451e2e881934119e435d6ce54ce8157dac724753143b48e6652eb7'
            '7d373a219df170d774431d5118432bcc7adc01aee07733972e651cd1a4dfb619')

package() {
  install -Dm0755 "$srcdir/${_tarfile}/bin/robo3t" "$pkgdir/usr/bin/robo3t"
  install -Dm0644 "$srcdir/robo3t.desktop" "$pkgdir/usr/share/applications/robo3t.desktop"
  install -Dm0644 "$srcdir/logo-256x256.png" "$pkgdir/usr/share/pixmaps/robo3t.png"
  install -Dm0644 "$srcdir/${_tarfile}/LICENSE" "$pkgdir/usr/share/licenses/robo3t/LICENSE"
  install -Dm0644 "$srcdir/${_tarfile}/COPYRIGHT" "$pkgdir/usr/share/doc/robo3t/COPYRIGHT"
}
