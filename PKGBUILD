# Contributor: Radostin Stoyanov <rstoyanov1 at gmail dot com>

pkgname=antconc
pkgver=3.5.8
_pkgver=${pkgver//./}
_appname=AntConc_64bit
pkgrel=2
pkgdesc="A freeware corpus analysis toolkit for arrying out corpus linguistics research and data-driven learning."
arch=('x86_64')
url="http://www.laurenceanthony.net/software/antconc/"
license=('custom')
options=("!strip")
source=($pkgname-$pkgver.tar.gz::http://www.laurenceanthony.net/software/antconc/releases/AntConc${_pkgver}/AntConc_64bit.tar.gz
	license-$pkgname-$pkgver.pdf::http://www.laurenceanthony.net/software/antconc/releases/AntConc${_pkgver}/license.pdf
	${pkgname}.png ${pkgname}.desktop)
sha256sums=('379650052362122ec705b84ad3bb24afdda750e4c1277f86f87c5177fa89e5a2'
            'd9607d639078ac6ac4a848946ba98aa05faa84dfe0a157173b3b7b545e252367'
            '2961431f1dd2c11a7af92e5ab594ddfd43e42ccc582cddca70128c781101525e'
            '56fa958a9100000a16bf95c0d7d082aee166ac376ec007ab1746def1adafa3f1')

package() {
  install -Dm755 "$srcdir"/${_appname} "$pkgdir"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png 
  install -Dm644 ${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}desktop 
  install -Dm644 license-$pkgname-$pkgver.pdf "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
}
