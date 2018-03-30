pkgname=msvc-wine-rust-git
_gitname=msvc-wine-rust
pkgver=r9.fcd20a1
pkgrel=1
pkgdesc="Cross compile Rust programs to the MSVC Windows target using Wine"
url="https://github.com/est31/${_gitname}"
license=(MIT)
depends=('p7zip' 'wine>=2.21' 'msitools>0.97')
arch=(any)
source=("git+https://github.com/est31/${_gitname}.git")

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	./get.sh
}

package() {
	install -Dm755 "${srcdir}/${_gitname}/linker.sh" "${pkgdir}/usr/bin/link.exe"
}

# makepkg -g >> PKGBUILD
md5sums=('SKIP')
