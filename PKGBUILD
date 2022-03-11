# Maintainer: TheDarkBug adrianoliviero23@gmail.com
pkgname=asim
pkgver=3.0
pkgrel=2
epoch=1996
pkgdesc="Ambiente per la simulazione del processore Motorola 68000"
_gistver="ad65478b9c947566c84ce71ce1bbb0689b2685ae"
arch=("x86_64")
url="https://digilander.libero.it/rosario.cerbone/Asim.htm"
license=('unknown')
depends=('wine')
source=("https://digilander.libero.it/rosario.cerbone/Asim/$pkgname.zip"
	"https://digilander.libero.it/rosario.cerbone/Asim/asimtool.zip"
	"https://digilander.libero.it/rosario.cerbone/Asim/68kasm.zip"
	"https://digilander.libero.it/rosario.cerbone/Asim/simple.zip"
	"https://gist.github.com/TheDarkBug/ce5c23a704c2254533663245465e713b/archive/$_gistver.zip")
sha512sums=('9509e22519e96356f5559f05b2451f0e6a5a3bf9ce3c1662e3ea8a375848cec4d1ec4c7a2e3d733849b65d61278487626d5553d836f8d1e8e78afc3580e474da' # asim.zip
	'4e5f4243196d4ebeb0a5a76fd328312dbf209639345d18e1ee82f7558dc00c7c906ba932ce9df00cc0f52eba1bea096cb4c9b600cba158c407aa70b14bf9cca6'            # asimtool.zip
	'25b0538206c2054d73c20e71875465c6bc82c6a376af02ed9ad1c2306299f958d64db720c826164eceee3cd399dd8a3859fde47e909b5fc8b123b03ba7eee090'            # 68kasm.zip
	'c0eb40da35eb052ae8bd8e907b4d7b7ecf33c7808e6b60778c56c4bf88b82027b5a0efbcd6cf0e92b15a7b344419576ee84cbe7118c23f6c4f214922c2e07744'            # simple.zip
	'1cc2641df6001f0a57396e816b1936e4ce1191ad7c99cc7781bde594f3265269da020a9ba3f262f44816e73c7ecb8b796ff24ac0fc7aebf3abe1a6dda1b74a1b')           # my gist zip

prepare() {
	mkdir -pv $srcdir/opt/$pkgname $srcdir/usr/{share/applications,bin}
}

build() {
	install -t $srcdir/opt/$pkgname $pkgname.exe asimtool.exe 68kasm.exe simple.cfg
	install -t $srcdir/usr/share/applications $srcdir/ce5c23a704c2254533663245465e713b-$_gistver/$pkgname.desktop
	install -t $srcdir/usr/bin $srcdir/ce5c23a704c2254533663245465e713b-$_gistver/$pkgname
}

package() {
	mv -t $pkgdir $srcdir/opt $srcdir/usr
}
