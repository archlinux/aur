pkgname=dmenu-supermario9590-git
pkgver=4.9.r572.9b38fda
pkgrel=1
epoch=
pkgdesc="This is my personal build of dmenu that is patched for fonts, centering, borders, etc."
arch=(x86_64 i686)
url="https://www.gitlab.com/supermario9590/dmenu-supermario9590.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(dmenu)
conflicts=(dmenu)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
		cd "${_pkgname}"
		    printf "4.9.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	    }

    build() {
	    	cd dmenu-supermario9590
		    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
	    }

    package() {
	        cd dmenu-supermario9590  
		    mkdir -p ${pkgdir}/opt/${pkgname}
		        cp -rf * ${pkgdir}/opt/${pkgname}
			    make PREFIX=/usr DESTDIR="${pkgdir}" install
			        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
			    }

