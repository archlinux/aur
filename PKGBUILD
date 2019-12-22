# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com> 
pkgname=carla-bridges
pkgver=2.0.0
pkgrel=2
_mirror=http://mirrors.kernel.org
_ubuntupkg=0ubuntu3
pkgdesc="Carla All Bridges (Stable Branch)"
arch=('x86_64')
url="http://kxstudio.sf.net/carla"
license=('GPL2')
conflicts=('carla-bridges-win32' 'carla-bridges-win64')
depends=('wine' 'carla')
source=("${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-linux32_2.0.0-${_ubuntupkg}_i386.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-linux64_2.0.0-${_ubuntupkg}_amd64.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-win32_2.0.0-${_ubuntupkg}_i386.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-win64_2.0.0-${_ubuntupkg}_amd64.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-wine32_2.0.0-${_ubuntupkg}_i386.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-wine64_2.0.0-${_ubuntupkg}_amd64.deb")
noextract=("${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-linux32_2.0.0-${_ubuntupkg}_i386.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-linux64_2.0.0-${_ubuntupkg}_amd64.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-win32_2.0.0-${_ubuntupkg}_i386.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-win64_2.0.0-${_ubuntupkg}_amd64.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-wine32_2.0.0-${_ubuntupkg}_i386.deb"
        "${_mirror}/ubuntu/pool/universe/c/carla/carla-bridge-wine64_2.0.0-${_ubuntupkg}_amd64.deb")
md5sums=('9ea8849390fdbb25d2dce6e8a4527ed3'
         '43657e010a8199464117432708b95151'
         'b46495b9626fed87c8aa1befa3982ebb'
         'cee1d6589c5c50ecfcdd04c1f1509df2'
         'da8eb8e4240f200181e7f6f7613cc6c4'
         '1057fa4f5a166f6c560a89a27b9a0beb')

prepare() {
	for file in *.deb; do
	    ar p $file data.tar.xz | tar -Jx
	done
}

package() {	
    mkdir $pkgdir/usr
    cp -rv $srcdir/usr/* $pkgdir/usr
}
