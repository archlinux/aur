# Maintainer: Jeremiah Ticket <seashellpromises@gmail.com>
pkgname=('brailleblaster-bin')
pkgver=2.0.40
pkgrel=1
        pkgdesc='a braille translater written in java'
arch=('x86_64')
        depends=('java-environment')
license=('custom')
url='https://www.brailleblaster.org/'
_dlname='brailleblaster'
source=("https://aphassets.blob.core.windows.net/${_dlname}/dist/stable/${_dlname}-${pkgver}-stable.zip"
        "brailleblaster.desktop"
"brailleblaster.sh")
sha256sums=('8e1df874c515300619740680d64257ed3ac191e7aca26b35879ad6acf3df7d18'
            'e206b8149f0197dd3e207886b01ced78e69db71850125e686e2a506e797e5880'
            '0aadb597445281067eae8ad09ffda9bb5f93422cda849c0086dfed5b64c80c84')

package() {
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${_dlname}/LICENSE
  install -dm755 $pkgdir/opt/${_dlname}/
  install -Dm644 ${_dlname}.desktop $pkgdir/usr/share/applications/${_dlname}.desktop
rm ${srcdir}/brailleblaster-nix.sh
  cp -r ${srcdir}/* $pkgdir/opt/${_dlname}/
rm ${srcdir}/${_dlname}-${pkgver}-stable.zip
install -Dm755 brailleblaster.sh $pkgdir/opt/${_dlname}/brailleblaster-nix.sh
}
