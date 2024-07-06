# Maintainer: Paragoumba <aur at paragoumba dot fr>
# Contributor: Renaud Littolff <rlittolff@gmail.com>

pkgname=proton-pass
pkgver=1.19.2
pkgrel=3
pkgdesc="Open-source password manager for effortless protection. Securely store, share and auto-login your accounts with Proton Pass, using end-to-end encryption trusted by millions."
arch=("x86_64")
url="https://proton.me/pass"
groups=("ProtonPass")

makedepends=("git" "python-setuptools")
source=("https://proton.me/download/PassDesktop/linux/x64/ProtonPass_${pkgver}.deb")
sha256sums=('a75e9095e5fa654bba65f10f58269369670cce8176aee360b6f9c30c7f7988b4')

conflicts=('protonpass' 'protonpass-bin' 'proton-pass-bin')
replaces=('protonpass-bin' 'proton-pass-bin')

package() {
	tar -xvf data.tar.xz -C "$pkgdir/"

	install -d "$pkgdir/opt/"
	mv "$pkgdir/usr/lib/proton-pass" "$pkgdir/opt/"

	ln -sf "/opt/proton-pass/Proton Pass" "$pkgdir/usr/bin/proton-pass"

	rm -rf "$pkgdir"/usr/share/{doc,lintian}
}
