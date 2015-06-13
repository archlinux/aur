# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=razen
pkgver=0.9.6
revision=2056
pkgrel=2
pkgdesc="A cross-platform PCB design tool that allows you to quickly design and fabricate boards."
depends=('mercurial')
arch=('i686' 'x86_64')
url="http://razencad.com/"
license=('freeware')

if [ "$CARCH" == x86_64 ]; then
  source=("https://s3.amazonaws.com/razen/razen-lin64-${pkgver}-r${revision}.tar.gz"
	   razen.sh)
  md5sums=('655bd36a593bbe8d6ad1546ade44cfc4'
           'aa248c787eb6c15e7fdf49fe17a95bed')
else
  source=("https://s3.amazonaws.com/razen/razen-lin32-${pkgver}-r${revision}.tar.gz"
	   razen.sh)
  md5sums=('05b62ee8b508d847747fff5d7429aaa4'
           'aa248c787eb6c15e7fdf49fe17a95bed')
fi

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -R ${srcdir}/razen ${pkgdir}/opt/razen

    touch ${pkgdir}/opt/razen/razen.log
    chmod 666 ${pkgdir}/opt/razen/razen.log
    
    install -Dm755 razen.sh ${pkgdir}/usr/bin/razen
}
