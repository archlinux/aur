# Maintainer: Syreese <syreese@example.com>
pkgname=hypertyper
_pkgname=HyperTyper
pkgver=1.0.1
pkgrel=1
pkgdesc="A CLI Typing Game with multiple modes, streaks, and sound effects"
arch=('any')
url="https://github.com/SyreeseOfficial/HyperTyper"
license=('MIT')
depends=('python' 'python-pygame' 'python-colorama')
makedepends=()
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP') # Update with 'updpkgsums' or 'sha256sum' on the downloaded file

package() {
    # GitHub archive usually extracts to RepoName-Tag
    cd "${_pkgname}-${pkgver}" || cd "${pkgname}-${pkgver}" || return 1
    
    # Install the main executable
    install -Dm755 hypertyper.py "$pkgdir/usr/bin/$pkgname"
    
    # Install data files to /usr/share/hypertyper/data
    mkdir -p "$pkgdir/usr/share/$pkgname/data"
    cp -r data/* "$pkgdir/usr/share/$pkgname/data/"
}
