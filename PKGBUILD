# Maintainer: Daniel Ruiz de Alegria <daniruizdealegria@gmail.com>

pkgname="flat-remix-gtk-git"
pkgver=r22.b78d8c6
pkgrel=1
pkgdesc="Flat Remix GTK theme is a pretty simple gtk window theme inspired on material design following a modern design using "flat" colors with high contrasts and sharp borders."
arch=('any')
url="https://drasite.com/flat-remix-gtk"
license=('GPL 3.0')
source=("${pkgname}::git+https://github.com/daniruiz/Flat-Remix-GTK.git")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}/"
  printf "r% s.% s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}/"
	install -dm755 "${pkgdir}/usr/share/themes"
	cp -a "Flat-Remix-GTK"* "${pkgdir}/usr/share/themes/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
