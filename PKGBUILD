# Maintainer: Amelia (AmeliaYeah@aur.archlinux.org)
pkgname='ctf-recon-utils'
pkgver="1.0.0"
pkgrel=1.1
pkgdesc="Some scripts that make CTF Reconnaisance a bit more straightforward."
arch=('x86_64')
url="https://github.com/AmeliaYeah/ctf-recon-utils"
license=('GPL')
depends=('ffuf' 'gobuster' 'nikto' 'curl' 'nmap' 'python3' 'python-pip')
optdepends=('libnotify')
source=("https://github.com/AmeliaYeah/ctf-recon-utils/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	echo "Making the package directories..."
	mkdir -p "$pkgdir/usr"

	echo "Setting the base directory for the installation script..."
	base_dir="$pkgdir"
	export base_dir

	echo "Moving into the cloned repository..."
	git_repo="$srcdir/ctf-recon-utils-${pkgver}"
	cd "$git_repo"

	echo "Running the install script..."
	chmod +x ./install.sh
	./install.sh
}
