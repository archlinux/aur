# Maintainer: Fernando Seoane <fseoane@hotmail.com>
mypackagename=pyNotify   # only if github repo has a different name than this pkgbase/pkgname
pkgname=pynotify-bin
pkgbase=pynotify-bin
pkgver=0.7      # remember to also change the version number bellow in the pkgver() function
pkgrel=2
epoch=
pkgdesc="A Gnome (wayland) shell notifier for Gotify and Ntfy server."
arch=('x86_64')
url="https://github.com/fseoane/pyNotify.git"
license=('MIT')
groups=()
depends=('libappindicator-gtk3' 'gnome-shell-extension-appindicator')
makedepends=()
checkdepends=()
optdepends=()
provides=(pyNotify)
conflicts=(pyNotify)
replaces=(pyNotify)
backup=('etc/pyNotify.conf' 'opt/pyNotify/pyNotify.conf')
options=()
install=
changelog=
source=("https://github.com/fseoane/pyNotify/releases/download/v${pkgver}/${mypackagename}.${pkgver}_Arch_amd64.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


package() {
	cd "${mypackagename}.${pkgver}_Arch_amd64"
	mkdir -p ${pkgdir}/opt/${mypackagename}
	
	install -Dm755 --owner=root --group=users ${mypackagename} ${pkgdir}/opt/${mypackagename}/${mypackagename}
	install -Dm755 --owner=root --group=users ${mypackagename}.desktop ${pkgdir}/opt/${mypackagename}/${mypackagename}.desktop
	install -Dm755 --owner=root --group=users *.ogg ${pkgdir}/opt/${mypackagename}/
	install -Dm755 --owner=root --group=users *.png ${pkgdir}/opt/${mypackagename}/
	install -Dm755 --owner=root --group=users *.svg ${pkgdir}/opt/${mypackagename}/
	install -Dm755 --owner=root --group=users ${mypackagename}.ver ${pkgdir}/opt/${mypackagename}/${mypackagename}.ver
	install -Dm755 --owner=root --group=users ${mypackagename}.conf ${pkgdir}/opt/${mypackagename}/${mypackagename}.conf
	install -Dm644 --owner=root --group=root  ${mypackagename}.conf ${pkgdir}/etc/${mypackagename}.conf

	desktop-file-install --dir=$pkgdir/usr/share/applications ${pkgdir}/opt/${mypackagename}/${mypackagename}.desktop
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${mypackagename}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${mypackagename}/README.md"
}
