pkgname=spaces
pkgver=8
pkgrel=1
pkgdesc="A CLI tool that helps you open your apps more easily"
arch=('any')
url="https://github.com/simit22/spaces" 
license=('GPL')
depends=('python' 'python-rich')
source=("spaces.py")
md5sums=('SKIP')

package() {
    # Create directories
    install -Dm755 "$srcdir/spaces.py" "$pkgdir/usr/lib/spaces/spaces.py"

    # Create wrapper script
    echo '#!/bin/bash' > "$pkgdir/usr/bin/spaces"
    echo "python /usr/lib/spaces/spaces.py \"\$@\"" >> "$pkgdir/usr/bin/spaces"
    chmod +x "$pkgdir/usr/bin/spaces"
}
