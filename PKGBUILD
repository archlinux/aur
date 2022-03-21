# Maintainer: Max le Fou <buttbadger at gmail dot com>

pkgname=mpk-m2-editor
pkgver=git.latest
pkgrel=1
pkgdesc="Alternative to the official AKAI MPKMini MkII Editor"
url=https://github.com/PiOverFour/MPK-M2-editor
license=('GPL3')
arch=('x86_64')

depends=('python' 'python-pip' 'alsa-lib' 'jack2')

source=('git+https://github.com//PiOverFour/MPK-M2-editor.git'
        'mpk-m2-editor.desktop'
        'mpk-m2-editor.png')

md5sums=('SKIP'
         'dabeb26a1b3903188101a2ac7568c01b'
         'ee14f75954abc3c8e04bb7f9e9e4f304')

build()
{
	cd "$srcdir/MPK-M2-editor"
	pip install -r requirements.txt
}

package()
{
	mkdir -p "${pkgdir}/usr/share/MPK-M2-editor"
	cp -r "$srcdir/MPK-M2-editor" "${pkgdir}/usr/share"
	install -Dm644 "$srcdir/mpk-m2-editor.desktop" "${pkgdir}/usr/share/applications/mpk-m2-editor.desktop"
	install -Dm644 "$srcdir/mpk-m2-editor.png" "${pkgdir}/usr/share/pixmaps/mpk-m2-editor.png"

}
