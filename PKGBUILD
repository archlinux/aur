pkgname=spaces
pkgver=7
pkgrel=1
pkgdesc="A CLI tool that helps you open your apps more easily"
arch=('any')
url="https://github.com/simit22/spaces"
license=('GPL')
depends=('python' 'python-rich')
source=("spaces.py")
md5sums=('SKIP')


package() {
    cd "$srcdir"
    install -Dm755 spaces.py "$pkgdir/bin/spaces.py"  # Install the script in /bin/
    echo -e '#!/bin/bash\npython /bin/spaces.py "$@"' > "$pkgdir/bin/spaces"  # Create a wrapper script
    chmod +x "$pkgdir/bin/spaces"  # Make the wrapper script executable
}
