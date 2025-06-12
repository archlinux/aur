# Maintainer: Your Name <youremail@example.com>

pkgname=spaces
pkgver=9
pkgrel=1
pkgdesc="A CLI tool that helps you open your apps more easily"
arch=('any')
url="https://github.com/simit22/spaces" 
license=('GPL')
depends=('python' 'python-rich')
source=("https://raw.githubusercontent.com/simit22/spaces/main/spaces.py") 
md5sums=('SKIP')

package() {
    # Create the directory for the Python script
    install -d "$pkgdir/usr/lib/spaces"

    # Install the main Python script
    install -m755 "$srcdir/spaces.py" "$pkgdir/usr/lib/spaces/"

    # Create the executable wrapper
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/spaces" <<EOF
#!/bin/bash
python /usr/lib/spaces/spaces.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/spaces"
}
