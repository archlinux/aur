# Maintainer: Foppe Hemminga <foppe@hemminga.net>
# Contributer: actionless <actionless dot loveless at gmail.com>
# Contributer: Schala <schalaalexiazeal at gmail.com>
pkgname=aporia-git
pkgver=0.1.1.0.99
pkgrel=1
pkgdesc="IDE/Advanced text editor mainly focusing on support for the Nimrod programming language."
arch=('i686' 'x86_64')
url="https://github.com/nim-lang/Aporia"
license=("GPL2")
makedepends=('nimble' 'git')
depends=('gtksourceview2')
source=("${pkgname%-*}::git+https://github.com/nim-lang/Aporia.git"
        'aporia.desktop')
md5sums=('SKIP'
         'ca13ad654b964f8f28082c6d2e033dea')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	git describe --tags | sed 's|^v||;s|\(.*-.*\)-.*|\1|;s|-|.|'
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	nimble build -y
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -Dm644 "$srcdir/aporia.desktop" "$pkgdir/usr/share/applications/aporia.desktop"
	install -Dm755 "aporia" "$pkgdir/usr/bin/aporia"
	install -Dm644 "share/gtksourceview-2.0/language-specs/actionscript.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/actionscript.lang"
	install -m644 "share/gtksourceview-2.0/language-specs/asm-intel.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/automake.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/bennugd.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/bluespec.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m755 "share/gtksourceview-2.0/language-specs/check-language.sh" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/cobol.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/gdb-log.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/idl-exelis.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/imagej.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/j.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/json.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/markdown.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/matlab.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/mxml.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/nael.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/nasm.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/netrexx.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/nim.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/objj.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/opal.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/opencl.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/protobuf.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/puppet.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/python3.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/scilab.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/sml.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -m644 "share/gtksourceview-2.0/language-specs/systemverilog.lang" "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
	install -Dm644 "share/gtksourceview-2.0/styles/darknim.xml" "$pkgdir/usr/share/gtksourceview-2.0/styles/darknim.xml"
	install -m644 "share/gtksourceview-2.0/styles/ekini_edit.xml" "$pkgdir/usr/share/gtksourceview-2.0/styles/"
	install -m644 "share/gtksourceview-2.0/styles/piekno.xml" "$pkgdir/usr/share/gtksourceview-2.0/styles/"
	install -m644 "share/gtksourceview-2.0/styles/yumbum.xml" "$pkgdir/usr/share/gtksourceview-2.0/styles/"
	install -Dm644 "copying.txt" "$pkgdir/usr/share/licenses/$pkgname/copying.txt"
}
