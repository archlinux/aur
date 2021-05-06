# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gabriel Guldner <gabriel at guldner.eu>
pkgname=git-credential-manager-core-bin
_pkgname=git-credential-manager-core
pkgver=2.0.435
_pkgver=2.0.435-beta
_build=9025
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
source=("https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v$_pkgver/gcmcore-linux_amd64.$pkgver.$_build.tar.gz"
		"$_pkgname.install"
		'LICENSE')
sha256sums=('08e1f0111c93d8f45e3db6071f73b6be881984531c55a350442c11c9985ef38c'
            '399aa9e3cf7a30c3658129564f9aa14871de61aed9a1b429ecc4f96a92a69400'
            '30147347d5ce41662672ea2be7b158ae0e014398b97a148dd07bfd46c5166292')

package() {
	cd "$srcdir"
	install -Dm755 -o0 -g0 git-credential-manager-core "$pkgdir/usr/bin/git-credential-manager-core"
	install -Dm644 -o0 -g0 LICENSE "$pkgdir/usr/share/licenses/git-credential-manager-core-bin/LICENSE"
}
