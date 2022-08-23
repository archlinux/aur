# Maintainter: Lu Xu <oliver_lew at outlook dot com>

pkgbase=reduce
pkgname=(reduce-common reduce-csl reduce-psl reduce-addons)
pkgver=6339
pkgrel=1
arch=('x86_64')
url="https://reduce-algebra.sourceforge.io/"
license=('BSD')
depends=('ncurses' 'libxrandr' 'libxft' 'freetype2' 'expat' 'libxcursor')
source_urlbase="https://master.dl.sourceforge.net/project/reduce-algebra/snapshot_2022-06-17/linux64"
source=("$source_urlbase/reduce-common_${pkgver}_all.tgz"
        "$source_urlbase/reduce-csl_${pkgver}_amd64.tgz"
        "$source_urlbase/reduce-psl_${pkgver}_amd64.tgz"
        "$source_urlbase/reduce-addons_${pkgver}_amd64.tgz")
md5sums=('62a149738bf686fe95dfea01a85db473'
         'd120ef3439345b81451fac9aaf313914'
         '5b91954a19c91c4327c3ceaac1581cba'
         'e9241bc1c0fd49396e914a637a951b6b')
sha1sums=('494ab79032558069ad1360ab83d796b95019e9b3'
          '22a0afcc43e5c95f550cbc2da0021214b22ec918'
          'd412b38e12984dd9580e4e9183a48f7ec7ed7e29'
          'ab4326cca91964d0db6e3e2da928a16907785d38')
noextract=("${source[@]##*/}")

package_reduce-common() {
    provides=('reduce-common')
    conflicts=('reduce-common')
    pkgdesc="A Portable General-Purpose Computer Algebra System -- common files"

    tar zxf reduce-common_${pkgver}_all.tgz -C $pkgdir
}

package_reduce-csl() {
    depends=('reduce-common')
    provides=('reduce-csl')
    conflicts=('reduce-csl')
    pkgdesc="A Portable General-Purpose Computer Algebra System -- CSL based"

    tar zxf reduce-csl_${pkgver}_amd64.tgz -C $pkgdir
}

package_reduce-psl() {
    depends=('reduce-common')
    provides=('reduce-psl')
    conflicts=('reduce-psl')
    pkgdesc="A Portable General-Purpose Computer Algebra System -- PSL based"

    tar zxf reduce-psl_${pkgver}_amd64.tgz -C $pkgdir
}

package_reduce-addons() {
    provides=('reduce-addons')
    conflicts=('reduce-addons')
    pkgdesc="A Portable General-Purpose Computer Algebra System -- addons"

    tar zxf reduce-addons_${pkgver}_amd64.tgz -C $pkgdir
}
