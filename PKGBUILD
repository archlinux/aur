# Maintainer: Ryan Salvador <salvadorrye@gmail.com>
# Contributor: Ryan Salvador <salvadorrye@gmail.com>
pkgname=glise-bin
pkgver=1.7.1_1
pkgrel=1
pkgdesc="A subdivision surfaces 3D modeler featuring a complete Python API."
arch=('x86_64')
url="http://www.twistednormal.com/"
license=('custom')
depends=('aarch64-linux-gnu-gcc'
         'freetype2'
         'gcc-libs'
         'glibc'
         'intel-tbb'
         'libpng12'
         'libx11'
         'libxau'
         'libxcb'
         'libxcursor'
         'libxdmcp'
         'libxext'
         'libxfixes'
         'libxinerama'
         'libxrandr'
         'libxrender'
         'libxxf86vm'
	 'vagrant')
source=(http://www.twistednormal.com/download/glise_1.7.1_amd64.deb)
md5sums=('eb0453d1708e9113e24f333a6b5e4553')
package() {
    tar -xf data.tar.xz -C "${pkgdir}"
    install -D -m644 "${pkgdir}/opt/glise/COPYRIGHTS.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${pkgdir}/opt/glise/EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
    ln -s "/usr/lib/x86_64-linux-gnu/libembree.so" "${pkgdir}/usr/lib/libembree.so"
    ln -s "/usr/lib/x86_64-linux-gnu/libembree.so.2" "${pkgdir}/usr/lib/libembree.so.2"
    ln -s "/usr/lib/x86_64-linux-gnu/libembree.so.2.13.0" "${pkgdir}/usr/lib/libembree.so.2.13.0"
}
