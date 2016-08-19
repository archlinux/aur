# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=git-scripts-jwiegley-git
pkgver=8ae43cb
pkgrel=3
pkgdesc="Git scripts written by different people (collected by John Wiegley)"
url="https://github.com/jwiegley/git-scripts"
arch=(any)
license=('unknown')
depends=('git')
optdepends=('perl: git-archive-all, git-flush, git-force-mtimes, git-forest, git-rm-conflicts'
            'python: git-changelog, git-record'
            'ruby: git-flatten, git-merge-from-svn, git-opendiff, git-all, git-wtf, git-find, git-rank-contributors')
source=("git://github.com/jwiegley/git-scripts.git")
sha256sums=('SKIP')

provides=(git-addremove git-addsub git-addtree git-all git-all-commits
git-amend-all git-apply-url git-archive-all git-branch-status git-build
git-changebar git-changelog git-checkout-branches git-children-of git-clone
git-closest-match git-cmpdir git-current git-delete-branch git-delete-tag
git-diff-directory git-diff-dw git-discover-large-blobs git-empty-branch
git-erase-reflog git-every git-external-ediff git-filemerge git-find
git-find-blob git-find-children git-find-fetch git-find-usefull-dangling-trees
git-fire git-fixws git-flatten git-flush git-follow git-force-mtimes git-forest
git-full-reset git-hunt-and-seek git-ignore-wizard git-igunk
git-interactive-merge git-master git-maxpack git-merge-dw git-merge-from-svn
git-merge-repo git-opendiff git-publish git-publish-repo git-push-all
git-push-branch git-push-home git-rank-contributors git-rebranch git-record
git-remote-in-sync git-remove git-remove-empty-commits git-rename git-retrack
git-rm-conflicts git-root git-save git-save-file git-save-home git-signed-tag
git-smerge git-snapshot git-status-all git-svn-diff git-sync git-tag-diff
git-tarball git-touch-repos git-track-branch git-trash git-trial-merge git-undo
git-unpack git-whoami git-working-tree git-write-stream-info git-wtf)

conflicts=(git-addremove git-addsub git-addtree git-all git-all-commits
git-amend-all git-apply-url git-archive-all git-branch-status git-build
git-changebar git-changelog git-checkout-branches git-children-of git-clone
git-closest-match git-cmpdir git-current git-delete-branch git-delete-tag
git-diff-directory git-diff-dw git-discover-large-blobs git-empty-branch
git-erase-reflog git-every git-external-ediff git-filemerge git-find
git-find-blob git-find-children git-find-fetch git-find-usefull-dangling-trees
git-fire git-fixws git-flatten git-flush git-follow git-force-mtimes git-forest
git-full-reset git-hunt-and-seek git-ignore-wizard git-igunk
git-interactive-merge git-master git-maxpack git-merge-dw git-merge-from-svn
git-merge-repo git-opendiff git-publish git-publish-repo git-push-all
git-push-branch git-push-home git-rank-contributors git-rebranch git-record
git-remote-in-sync git-remove git-remove-empty-commits git-rename git-retrack
git-rm-conflicts git-root git-save git-save-file git-save-home git-signed-tag
git-smerge git-snapshot git-status-all git-svn-diff git-sync git-tag-diff
git-tarball git-touch-repos git-track-branch git-trash git-trial-merge git-undo
git-unpack git-whoami git-working-tree git-write-stream-info git-wtf)

pkgver () {
  cd ${srcdir}/git-scripts
  git rev-parse --short HEAD
}

prepare () {
  cd ${srcdir}/git-scripts
  for with_extension in git-*.*; do
    mv ${with_extension} ${with_extension%.*}
  done
}

package () {
  install -d ${pkgdir}/usr/bin
  find ${srcdir}/git-scripts -type f -perm 755 -name 'git-*' -exec install -t ${pkgdir}/usr/bin {} +
}
