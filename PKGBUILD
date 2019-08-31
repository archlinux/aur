# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=('git-nautilus-icons-common' 'git-nautilus-icons-common-py2' 'git-nautilus-icons' 'git-nautilus-icons-py2' 'git-nemo-icons' 'git-caja-icons-py2')
pkgbase=git-nautilus-icons
pkgver=1.1.1
pkgrel=0
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
source=("https://github.com/chrisjbillington/git_nautilus_icons/archive/${pkgver}.tar.gz")
sha512sums=('c5e439b1a91b183b6fe3d52ddeae796c2339a78cf9378736c6eaee336c27b8691be0052f76bf15e9e3901bce2e7a2f7bd3383fa928f252ad50be9a53c0090c7b')

package_git-nautilus-icons-common() {
    pkgdesc="Common files for the git-{nautilus,nemo}-icons packages"
    depends=('python-gobject')
    provides=('git-nautilus-icons-common')
    conflicts=('git-nautilus-icons-common' 'git-nautilus-icons-common-py2')

    cd "$srcdir/git_nautilus_icons-${pkgver}/git_nautilus_icons_common"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_git-nautilus-icons-common-py2() {
    pkgdesc="Common files for the git-{nautilus,caja}-icons-py2 packages"
    depends=('python2-gobject' 'python2-pathlib' 'python2-enum34')
    provides=('git-nautilus-icons-common-py2')
    conflicts=('git-nautilus-icons-common' 'git-nautilus-icons-common-py2')

    cd "$srcdir/git_nautilus_icons-${pkgver}/git_nautilus_icons_common"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_git-nautilus-icons() {
    pkgdesc="A Nautilus extension to overlay icons on files in git repositories"
    depends=('git-nautilus-icons-common')
    provides=('git-nautilus-icons')
    conflicts=('git-nautilus-icons' 'git-nautilus-icons-py2')

    cd "$srcdir/git_nautilus_icons-${pkgver}/git_nautilus_icons"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_git-nautilus-icons-py2() {
    pkgdesc="A Nautilus extension to overlay icons on files in git repositories, Python 2 version"
    depends=('git-nautilus-icons-common-py2')
    provides=('git-nautilus-icons-py2')
    conflicts=('git-nautilus-icons' 'git-nautilus-icons-py2')

    cd "$srcdir/git_nautilus_icons-${pkgver}/git_nautilus_icons"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_git-nemo-icons() {
    pkgdesc="A Nemo extension to overlay icons on files in git repositories"
    depends=('git-nautilus-icons-common')
    provides=('git-nemo-icons')
    conflicts=('git-nemo-icons' 'git-nemo-icons-py2')

    cd "$srcdir/git_nautilus_icons-${pkgver}/git_nemo_icons"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_git-caja-icons-py2() {
    pkgdesc="A Caja extension to overlay icons on files in git repositories, Python 2 version"
    depends=('git-nautilus-icons-common-py2')
    provides=('git-caja-icons-py2')
    conflicts=('git-caja-icons' 'git-caja-icons-py2')

    cd "$srcdir/git_nautilus_icons-${pkgver}/git_caja_icons"
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}