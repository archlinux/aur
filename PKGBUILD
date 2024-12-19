# Maintainer: Shibam Roy <royshibam9826@gmail.com>
pkgname=remime-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple way to manage your time from within your terminal. Its a simple TUI application with clock, pomodoro mode and more..."
arch=('any')               
conflicts=('remime')
url="https://github.com/ShibamRoy9826/remime"
license=('MIT')           
depends=('python' 'python-toml' 'python-pygame' 'python-textual' 'python-rich' )       
makedepends=('git' 'python' 'python-setuptools')
source=("git+https://github.com/ShibamRoy9826/remime.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/remime"
    git describe --long --tags | sed 's/^v//;s/-/./g'
}
package() {
    cd "$srcdir/remime"
    python setup.py install --root="$pkgdir/" --optimize=1
}
