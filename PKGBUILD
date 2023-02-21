# Contributor: Radostin Stoyanov <rstoyanov1 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=antconc
pkgver=4.2.0
_pkgver=${pkgver//./}
_appname=AntConc
pkgrel=1
pkgdesc="A freeware corpus analysis toolkit for arrying out corpus linguistics research and data-driven learning."
arch=('x86_64')
url="https://www.laurenceanthony.net/software/antconc/"
license=('custom')
options=("!strip")
source=($pkgname-$pkgver.tar.gz::https://www.laurenceanthony.net/software/antconc/releases/AntConc${_pkgver}/AntConc.tar.gz
	${pkgname}.png ${pkgname}.desktop $pkgname.sh)
sha256sums=('3ba127173843414ca15229f379dd378688122adeec103bfb0b070d917489e48f'
            '2961431f1dd2c11a7af92e5ab594ddfd43e42ccc582cddca70128c781101525e'
            '56fa958a9100000a16bf95c0d7d082aee166ac376ec007ab1746def1adafa3f1'
            'c529e3d8230f19e604c646d804278d9b0ca1dae4d3b97ade838ab10a32ff06f7')

package() {
  install -d "$pkgdir"/opt/
  cp -r ${_appname} "$pkgdir"/opt/
  install -Dm755 "$srcdir"/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir"/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 ${_appname}/app_resources/license.pdf $pkgdir/usr/share/licenses/$pkgname/license.pdf
}
