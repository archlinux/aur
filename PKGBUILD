# Maintainer: pank-su <pank@pank.su>

pkgname='godot-kotlin-jvm-bin'
pkgver='0.14.3'
_godotver='4.5.1'
pkgrel=1
pkgdesc='Custom Godot Game Engine build for Kotlin/JVM binding'
arch=('x86_64')
url='https://github.com/utopia-rise/godot-kotlin-jvm'
license=('MIT')
depends=('glibc' 'java-environment')
source=("${pkgname}_${pkgver}_${_godotver}.zip::https://github.com/utopia-rise/godot-kotlin-jvm/releases/download/${pkgver}-${_godotver}/godot-kotlin-jvm_editor_linuxbsd_x86_64_release_${pkgver}-${_godotver}.zip"
	   "godot-kotlin-jvm.desktop")
sha256sums=('a3c89c3f555a566b62625ca38976fbe68ada38bb509a9b809601e303888661aa'
            'ab85da31c53878c44d1ce0acfec913ff9e2436c3c8bbf002b74bdf62cef6278e')

prepare() {
    cd "$srcdir"
    
    
    mv "godot.linuxbsd.editor.x86_64.jvm.${pkgver}" "godot-kotlin-jvm"
}

package() {
	install -Dm755 ./godot-kotlin-jvm "${pkgdir}/usr/bin/godot-kotlin-jvm"
	install -Dm644 "$srcdir/godot-kotlin-jvm.desktop" "$pkgdir/usr/share/applications/godot-kotlin-jvm.desktop"
}
