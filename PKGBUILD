# Contributor: Radostin Stoyanov <rstoyanov1 at gmail dot com>

pkgname=antconc
pkgver=3.5.9
_pkgver=${pkgver//./}
_appname=AntConc_64bit
pkgrel=3
pkgdesc="A freeware corpus analysis toolkit for arrying out corpus linguistics research and data-driven learning."
arch=('x86_64')
url="https://www.laurenceanthony.net/software/antconc/"
license=('custom')
options=("!strip")
source=($pkgname-$pkgver.tar.gz::https://www.laurenceanthony.net/software/antconc/releases/AntConc${_pkgver}/AntConc_64bit.tar.gz
	license-$pkgname-$pkgver.pdf::https://www.laurenceanthony.net/software/antconc/releases/AntConc${_pkgver}/license.pdf
	${pkgname}.png ${pkgname}.desktop)
sha256sums=('ca0e7a25457911856c36e13591fd1d9b1d19cb30258836ca7659e5617192abd0'
            '2a21c2814af79bc7e9f3027c106f802054b2f195c5d7d4bc3487dc03f26f981f'
            '2961431f1dd2c11a7af92e5ab594ddfd43e42ccc582cddca70128c781101525e'
            '56fa958a9100000a16bf95c0d7d082aee166ac376ec007ab1746def1adafa3f1')

package() {
  install -Dm755 "$srcdir"/${_appname} "$pkgdir"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png 
  install -Dm644 ${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}desktop 
  install -Dm644 license-$pkgname-$pkgver.pdf "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
}
