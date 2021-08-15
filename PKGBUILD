# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gabriel Guldner <gabriel at guldner.eu>
pkgname=git-credential-manager-core-bin
_pkgname=git-credential-manager-core
pkgver=2.0.498
# _pkgver=2.0.452
_build=54650
pkgrel=1
pkgdesc="Secure, cross-platform Git credential storage with authentication to GitHub, Azure Repos, and other popular Git hosting services."
arch=('x86_64')
url="https://github.com/microsoft/Git-Credential-Manager-Core"
license=('MIT')
depends=('zlib' 'krb5')
optdepends=('kwallet: For storing credentials' 
			'gnome-keyring: For storing credentials' 
			'gnupg: For storing credentials in a gpg file'
			'pass: For storing credentials in a gpg file' )
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
changelog=
options=('!strip')
source=("https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v$pkgver/gcmcore-linux_amd64.$pkgver.$_build.tar.gz"
		"$_pkgname.install"
		'LICENSE')
sha256sums=('c364b78f896188beac64dfc75848a01a4189b4c01b5546e7932bba56a58cc7f7'
            '399aa9e3cf7a30c3658129564f9aa14871de61aed9a1b429ecc4f96a92a69400'
            '30147347d5ce41662672ea2be7b158ae0e014398b97a148dd07bfd46c5166292')

package() {
	cd "$srcdir"
	install -Dm755 -o0 -g0 git-credential-manager-core "$pkgdir/usr/bin/git-credential-manager-core"
	install -Dm644 -o0 -g0 LICENSE "$pkgdir/usr/share/licenses/git-credential-manager-core-bin/LICENSE"
}
