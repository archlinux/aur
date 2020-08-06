pkgname=st-supermario9590-git
pkgver=0.8.2.r1127.fa253f0
pkgrel=1
pkgdesc="A patched and customized build of st (the Suckless simple terminal)."
arch=(x86_64 i686)
url="https://gitlab.com/supermario9590/st-supermario9590.git"
license=('MIT')
groups=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(st)
conflicts=(st)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	  cd "${_pkgname}"
	    printf "0.8.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    }

build() {
	  cd st-supermario9590
	    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
    }

package() {
	  cd st-supermario9590  
	    mkdir -p ${pkgdir}/opt/${pkgname}
	      cp -rf * ${pkgdir}/opt/${pkgname}
	        make PREFIX=/usr DESTDIR="${pkgdir}" install
		  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	    }


