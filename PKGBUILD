# Maintainer: xiota / aur.chaotic.cx

# Many unrelated packages have used the name `polyglot`.
# To avoid making users install unwanted dependencies,
# please use a different name.

_pkgname="polyglot"
pkgbase="$_pkgname-meta"
pkgname=(
  "$_pkgname"
  # "$_pkgname-bin"
  # "$_pkgname-git"
)
pkgver=0.0.1
pkgrel=1
pkgdesc="metapackage - do not use; see comments"
arch=('any')

url='https://aur.archlinux.org/pkgbase/polyglot-meta'

for _name in "${pkgname[@]}" ; do
  _package_func="package_$_name() { "$'\n'

  if [ x"$_name" != x"$_pkgname" ] ; then
    _package_func+="depends=(\"$_pkgname\") "$'\n'
  else
    _package_func+=": "$'\n'
  fi

  _package_func+="}"$'\n'

  eval "$_package_func"
done
