# Maintainer: Jonathan Haylett <jonathan@haylett.dev>
_pkgbasename=wmctrl-python3
pkgname=$_pkgbasename-git
pkgrel=4
pkgver=v0.3
pkgdesc="A tool to programmatically control windows inside X"
arch=('any')
url="https://bitbucket.org/JonnyHaystack/wmctrl-python3"
license=('GPL')
depends=('python' 'mercurial' 'wmctrl')
source=(hg+https://bitbucket.org/JonnyHaystack/wmctrl-python3)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbasename"
    hg tags | sort -hr | head -n 1 | awk '{print $1}'
}

package() {
    cd "${srcdir}/${_pkgbasename}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
